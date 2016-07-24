import 'dart:async';

import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import '../shared/hero.dart';
import '../shared/hero_service.dart';

@Component(
    selector: 'heroes-dashboard',
    templateUrl: 'dashboard_component.html',
    styleUrls: const ['dashboard_component.css'])
class DashboardComponent implements OnInit {
  List<Hero> heroes;

  final Router _router;
  final HeroService _heroService;

  DashboardComponent(this._heroService, this._router);

  Future<Null> ngOnInit() async {
    heroes = (await _heroService.getHeroes()).skip(1).take(4).toList();
  }

  void goToDetail(Hero hero) {
    var link = [
      'HeroDetail',
      {'id': hero.id.toString()}
    ];
    _router.navigate(link);
  }
}