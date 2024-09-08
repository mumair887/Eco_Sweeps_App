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

//Addresses
  static const postAddress = "/address-store";
  static const getAddress = "/address";

//profile
  static const editprofile = "/edit-profile";
  static const updateprofile = "/update-profile";
}
