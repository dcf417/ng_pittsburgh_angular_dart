import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'package:angular2/platform/common.dart';
import 'dashboard_component/dashboard_component.dart';
import 'hero_detail_component/hero_detail_component.dart';
import 'heroes_component/heroes_component.dart';
import 'shared/hero_service.dart';


@Component(
    selector: 'app-component',
    template: '''
      <h1>{{title}}</h1>
      <nav>
        <a [routerLink]="['Dashboard']">Dashboard</a>
        <a [routerLink]="['Heroes']">Heroes</a>
      </nav>
      <router-outlet></router-outlet>''',
    styleUrls: const ['app_component.css'],
    directives: const [ROUTER_DIRECTIVES],
    providers: const [
      HeroService,
      ROUTER_PROVIDERS,
      const Provider(LocationStrategy, useClass: HashLocationStrategy)
    ])
@RouteConfig(const [
  const Route(
      path: '/dashboard',
      name: 'Dashboard',
      component: DashboardComponent,
      useAsDefault: true),
  const Route(
      path: '/detail/:id', name: 'HeroDetail', component: HeroDetailComponent),
  const Route(path: '/heroes', name: 'Heroes', component: HeroesComponent)
])
class AppComponent {
  String title = 'Tour of Heroes';
}