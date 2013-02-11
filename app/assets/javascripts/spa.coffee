class Storage
  constructor: ->

  whatever: -> 1
  save_categories: (json_table) =>
    useCase.categories = json_table.map (e) -> new Category(e.id, e.name)
  
  download_categories: =>
    $.getJSON "/spa/get_categories.json", (d,s) => @save_categories(d)

  save_products: (json_table) =>
    useCase.products = json_table.map (e) -> new Product(e.id, e.name, e.description, e.price, e.category_id)
  
  download_products: =>
    $.getJSON "/spa/get_products.json", (d, s) => @save_products(d)
    
class SpaUseCase
  constructor: ->
    @categories = []
    @products = []
    @search_results = []
  
  showCategories: ->
  showProducts: ->
  showCategory: (id) ->
  showProduct: (id) ->

  findProduct: (id) ->
    for p in @products
      if p.id == id
        return p
  findCategory: (id) ->
    for c in @categories
      if c.id == id
        return c
  findProductsForCategory: (id) ->
    return @products.filter (p) -> p.category_id == id

  search: () =>
    $("#product_search").submit( (e) -> return false )
    name = $("#q_name_cont").val()
    desc = $("#q_description_cont").val()
    price_lteq = $("#q_price_lteq").val() * 100.0
    price_gteq = $("#q_price_gteq").val() * 100.0

    @search_results = @products
    if name
      @search_results = @products.filter (p) -> p.name.has(name)
    if desc
      @search_results = @search_results.filter (p) -> p.description.has(desc)
    if price_lteq
      @search_results = @search_results.filter (p) -> p.price <= price_lteq
    if price_gteq
      @search_results = @search_results.filter (p) -> p.price >= price_gteq
    console.log(@search_results)

class GUI
  constructor: ->
    @fields = []
  
  show_categories: =>
    source = $("#category-list-template").html()
    template = Handlebars.compile(source)
    for c in useCase.categories
      $("#menu").append(template(c))
  
  show_products: =>
    $("#prod-header").html("Wszystkie produkty")
    $("#products-div").html("")
    source = $("#product-list-template").html()
    template = Handlebars.compile(source)
    for c in useCase.products
      $("#products-div").append(template(c))
  
  show_product: (p) =>
    $("#prod-header").html("Strona produktu")
    pcat = useCase.findCategory(p.category_id)
    p.categoryname = pcat.name
    p.price = p.price / 100
    source = $("#product-template").html()
    template = Handlebars.compile(source)
    $("#products-div").html(template(p))
    p.price = p.price * 100
  
  show_category: (id)=>
    $("#prod-header").html("Strona kategori")
    pcs = useCase.findProductsForCategory(id)
    source = $("#product-list-template").html()
    $("#products-div").html("")
    template = Handlebars.compile(source)
    for p in pcs
      $("#products-div").append(template(p))
  
  notice: (notice_text) =>
    $("p.notice").html(notice_text)
    $("p.notice").show()
    $("p.notice").hide(4000)
    
class WebGlue
  constructor: (@useCase, @gui, @st) ->
    Before(@useCase, 'showCategories', => @st.download_categories())
    After(@st, 'save_categories', => @gui.show_categories())
    Before(@useCase, 'showProducts', => @st.download_products())
    After(@st, 'save_products', => @gui.show_products())
    After(@useCase, 'showProduct', (id) => @gui.show_product(useCase.findProduct(id)))
    After(@useCase, 'showCategory', (id) => @gui.show_category(id))
    After(@useCase, 'search', => @gui.show_search_results())
    
class Main
  constructor: ->
    useCase = new ShopUseCase()
    window.useCase = useCase
    st = new Storage()
    window.st = st
    gui = new GUI()
    window.gui = gui
    glue = new WebGlue(useCase, gui, st)
    useCase.showCategories()
    useCase.showProducts()

class Category
  constructor: (@id, @name) ->
  
class Product
  constructor: (@id, @name, @description, @price, @category_id, @categoryname = "") ->
  
$(-> new Main())
