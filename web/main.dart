import 'package:angular2/core.dart';
import 'package:angular2/platform/browser.dart';
import 'package:angular_dart/app_component.dart';
import 'package:angular_dart/shared/in_memory_data_service.dart';
import 'package:http/http.dart';

void main() {
  bootstrap(AppComponent,
      const [const Provider(Client, useClass: InMemoryDataService)]);
}