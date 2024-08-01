extension StringExtension on String {
  RoutingData get getRoutingData {
    var uriData = Uri.parse(this);
    return RoutingData(
      route: uriData.path,
      queryParameters: uriData.queryParameters,
    );
  }
}

class RoutingData {
  final String route;
  final Map<String, dynamic> queryParameters;

  RoutingData({
    required this.route,
    required this.queryParameters,
  });
}
