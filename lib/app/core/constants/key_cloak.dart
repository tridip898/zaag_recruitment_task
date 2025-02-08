import 'app_constants.dart';

class KeyCloakConfig {
  static const originDev = "https://identity-dev.niseee.gov.bd";
  static const originProd = "https://identity.nise.gov.bd";

  static const clientId = 'Fqy6EIAFDKv2CZFTxSHJ_ozMSdga';
  static const clientSecret = "bfI71Vk8YX4p0e5aF8BEFl_AzvAa";
  static const redirectUrl = 'com.softbdltd.nise://callback';
  static String authorizationEndpoint =
      '${environment == Environment.prod ? originProd : originDev}/oauth2/authorize/';
  static String tokenEndpoint =
      '${environment == Environment.prod ? originProd : originDev}/oauth2/token';
  static String endSessionEndpoint =
      '${environment == Environment.prod ? originProd : originDev}/oidc/logout';
  static const postLogoutRedirectUrl = 'com.softbdltd.nise://logout';
}
