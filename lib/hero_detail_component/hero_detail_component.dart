import 'dart:async';
import 'dart:html';

import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import '../shared/hero.dart';
import '../shared/hero_service.dart';

@Component(
    selector: 'hero-detail',
    templateUrl: 'hero_detail_component.html',
    styleUrls: const ['hero_detail_component.css'])
class HeroDetailComponent implements OnInit {
  Hero hero;
  final HeroService _heroService;
  final RouteParams _routeParams;

  HeroDetailComponent(this._heroService, this._routeParams);

  Future<Null> ngOnInit() async {
    var idString = _routeParams.get('id');
    var id = int.parse(idString, onError: (_) => null);
    if (id != null) hero = await (_heroService.getHero(id));
  }

  Future<Null> save() async {
    await _heroService.save(hero);
    goBack();
  }

  void goBack() {
    window.history.back();
  }
}