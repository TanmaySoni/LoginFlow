import 'package:flutter/services.dart';
import 'dart:io';

class ImageConstants {
  // static String loader = "assets/images/loader.gif";
}

class ApiUrls {
  // static String launchMapsUrl(String source, String destination) {
  //   return "https://www.google.com/maps/dir/?api=1&origin=$source&destination=$destination&travelmode=driving";
  // }
}

enum Status {
  SUCCESSFUL,
  DISCONNECTED,
  UNKNOWN,
  WRONGPIN,
  EXPIRED,
  NOT_FOUND,
  PERMISSION_DENIED,
  PERMISSION_DENIED_NEVER_ASK,
  NULL,
}

const Map<Status, String> ErrorMessages = {
  Status.SUCCESSFUL: null,
  Status.DISCONNECTED: "No Internet Connection",
  Status.UNKNOWN: "Some Unknown error Occured, Please try Again",
  Status.WRONGPIN: "Wrong Pin",
  Status.EXPIRED: "Request has Expired, Please try Again",
  Status.NOT_FOUND: "Not Found",
  Status.PERMISSION_DENIED: "Permisssion Denied",
  Status.PERMISSION_DENIED_NEVER_ASK:
      "Permission denied - please ask the user to enable it from the app settings",
  Status.NULL: "Value cannot be null",
};

Future<Status> tryCatch(Function func, {Function finale}) async {
  try {
    await func();
    return Status.SUCCESSFUL;
  } on SocketException catch (e) {
    print("socket exception => $e");
    return Status.DISCONNECTED;
  } on PlatformException catch (e) {
    if (e.code == 'NULL') {
      return Status.NULL;
    } else if (e.code == "FirebaseException") {
      return Status.DISCONNECTED;
    } else if (e.code == 'PERMISSION_DENIED') {
      return Status.PERMISSION_DENIED;
    } else if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
      return Status.PERMISSION_DENIED_NEVER_ASK;
    } else if (e.code == 'EXPIRED') {
      return Status.EXPIRED;
    } else if (e.code == "ERROR_INVALID_VERIFICATION_CODE") {
      return Status.WRONGPIN;
    } else if (e.code == "ERROR_SESSION_EXPIRED") {
      return Status.EXPIRED;
    } else {
      print(e.code);
      return Status.UNKNOWN;
    }
  } catch (e) {
    if (e == "Page not Found") {
      return Status.NOT_FOUND;
    } else {
      print(e.toString());
      return Status.UNKNOWN;
    }
  } finally {
    if (finale != null) finale();
  }
}
