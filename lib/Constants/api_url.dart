class APIREQUEST {
  static String baseUrl = "http://ecosweeps.maxcoretechnologies.com/public/api";

// Categories Section
  static const categoryUrl = "/categories";
  static const subCategoryUrl = "/subcategories";

//Product Section
  static const productUrl = "/products";
  static const productDetails = "/product/detail";

//Auth Section
  static const signup = "/register";
  static const signupwithcode = '/login-with-code';
  static const login = "/login";
  static const logoutUrl = "/logout";
  static const deleteAccountUrl = "/account-delete";

//Cart Section
  static const addCart = "/cart";
  static const getViewCart = "/cart";
  static const updateCart = "/update-cart";
  static const getDeleteCart = "/delete-cart";
  static const addressDetail="/address-store";
}
