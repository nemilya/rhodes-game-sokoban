Игра Sokoban на базе фреймворка Rhodes
======================================

Rhodes - это фреймворк от RhoMobile - для создания платформенно независимых приложения
для смартфонов, на базе Ruby, в концепции MVC.


Установка
---------

Устанавливаем Ruby.

Установка гем `rhodes`:

    gem install rhodes


Генерируем приложение
---------------------

Генерируем приложение (см. http://docs.rhomobile.com/rhodes/generator#generating-a-rhodes-application-and-model)


    rhodes app rhodes-game-sokoban

Будет выведено в консоль:

    > rhodes app rhodes-game-sokoban
    Generating with app generator:
         [ADDED]  rhodes-game-sokoban/rhoconfig.txt
         [ADDED]  rhodes-game-sokoban/build.yml
         [ADDED]  rhodes-game-sokoban/.gitignore
         [ADDED]  rhodes-game-sokoban/app/application.rb
         [ADDED]  rhodes-game-sokoban/app/index.erb
         [ADDED]  rhodes-game-sokoban/app/index.bb.erb
         [ADDED]  rhodes-game-sokoban/app/layout.erb
         [ADDED]  rhodes-game-sokoban/app/loading.html
         [ADDED]  rhodes-game-sokoban/Rakefile
         [ADDED]  rhodes-game-sokoban/app/loading.png
         [ADDED]  rhodes-game-sokoban/app/helpers
         [ADDED]  rhodes-game-sokoban/icon
         [ADDED]  rhodes-game-sokoban/app/Settings
         [ADDED]  rhodes-game-sokoban/public


Rake задачи
-----------

Переходим в папку `rhodes-game-sokoban` в выводим доступные `rake` задачи,
командой `rake -T`:

    rake build:android:eclipsebundle        # Build RhoBundle for Eclipse project
    rake build:android:extensions           # Building native extensioons
    rake build:android:rhobundle            # Build RhoBundle for android
    rake build:symbian:rhobundle            # Build symbian rhobundle
    rake build:wp:rhobundle                 # Build WP7 rhobundle
    rake clean:android                      # Clean Android
    rake clean:bb                           # Clean bb
    rake clean:bbsim                        # Clean bb and simulator
    rake clean:iphone                       # Clean iphone
    rake clean:win32                        # Clean win32
    rake clean:wm                           # Clean wm
    rake clean:wp                           # Clean wp
    rake config:checkbb                     # Check local blackberry configuration
    rake device:android:debug               # Build debug self signed for device
    rake device:android:production          # Build production signed for device
    rake device:bb:debug                    # Build debug for device
    rake device:bb:production               # Build production for device
    rake device:iphone:production           # Builds and signs iphone for production
    rake device:symbian:production          # Build production for device
    rake device:wm:production               # Build production for device or emulator
    rake device:wp:production               # Build production for device or emulator
    rake package:bb:production_sim          # Package all production (all parts in one package) for simulator
    rake run:android                        # build and launch emulator
    rake run:android:device                 # build and install on device
    rake run:android:rhosimulator           # Run application on RhoSimulator
    rake run:bb                             # Builds everything, loads and starts bb sim and mds
    rake run:bb:rhosimulator                # Run application on RhoSimulator
    rake run:bb:startsim                    # Start Blackberry simulator
    rake run:bbapp                          # Builds everything and loads application on simulator
    rake run:bbdev                          # Same as run:bb, but only supports one app at a time and works faster
    rake run:iphone                         # Builds everything, launches iphone simulator
    rake run:iphone:rhosimulator            # Run application on RhoSimulator
    rake run:webrickrhologserver[app_path]  # start rholog(webrick) server
    rake run:win32                          # Run win32
    rake run:win32:production               # Build production for Motorola device
    rake run:wm                             # Build and run on WM6 emulator
    rake run:wm:cab                         # Build, install .cab and run on WM6 emulator
    rake run:wm:device                      # Build and run on the Windows Mobile device
    rake run:wm:device:cab                  # Build, install .cab and run on the Windows Mobile device
    rake run:wm:rhosimulator                # Run application on RhoSimulator
    rake run:wp                             # Build, install .xap and run on WP7 emulator
    rake run:wp:device                      # Build, install .xap and run on WP7 device
    rake run:wp:rhosimulator                # Run application on RhoSimulator
    rake uninstall:android                  # uninstall from emulator
    rake uninstall:android:device           # uninstall from device


Команды начинающеся с `run` - для запуска.


Запуск приложения
-----------------

Запускаем приложение в визуальном эмуляторе:


    rake run:iphone:rhosimulator


Через пару секунд будет запущен эмулятор, который выполнит наш исходный код
и откроются два окна: step1.png

Слева экран нашего приложения - заголовок, кнопка "Логин", и одна ссылка.

Справа - окно "Web Inspector".


Структура файлов приложения
---------------------------

Вот структура файлов нашего приложения, на данный этап:

    /app
      /helpers
      /Settings
      application.rb
      index.erb
      index.bb.erb
      layout.erb
      loading.html
      loading.png
    /icon
    /public
      /css
      /images
      /jqmobile
      /jquery
      /js
    /rhosimulator
    .gitignore
    build.yml
    Rakefile
    rhoconfig.txt

Здесь:
* `app` - это папка нашего приложения, т.к. наше приложение в рамках 
MCV (model, view, controller) - то там находятся файлы контроллеры (как правило
отдельная папка для каждого контроллера), модель, и вьюшка (шаблон отображения,
заканчивается на `.erb` - EmbeddedRuby - то есть встроенный в `html` ruby код).
* `icon` - иконки нашего приложения
* `public` - папка содержит картинки, css файлы, java-script библиотеки
* `rhosimulator` - "техническая" папка для работы эмулятора


Архитектура
-----------

В чём же принцип Rhodes?

Они предоставляют фреймворк на языке Руби. И разработав приложение на базе
этого фреймворка - посредством встроенных библиотек - можно "собрать" это
приложение для всех основных платформ смартфонов - Android, iPhone, WinMobile,
BlackBerry.

Достигается это посредством работы приложения как "браузер-сервер" в одном "флаконе".

То есть приложение на базе Rhodes - это миниатюрный веб-сервер, и система рендеринга
html страниц. При этом на базовом уровне - с помощью библиотек Rhodes - возможен доступ
к функциям смартфона - геопозиционирование, фотокамера, контакты, и так далее,
весь список предоставлен здесь: ...

Минусы данного подхода - что приложение требует больше ресурсов. Но на фоне
увеличивающеся мощности смартфонов - это уже не так принципиально.

Плюсы - достигается универсализация приложения, и возможность быстрого старта
при разработке приложений для смартфонов, без того чтобы отвлекаться на сборку 
приложения под конкретный смартфон.

Сборка приложения
-----------------

Все описания по сборке приложения на базе Rhodes для разных целевых смартфоно - 
доступны - для этого необходимо настроить SDK который предоставляется для 
разработчиков от платформы - Apple iOS, Google Android и т.д.

Но это достаточно ресурсоёмко, поэтому RhoMobile предоставили сервис, 
с помощью которого можно собрать своё Rhodes приложение под любую поддерживаему
платформу - бесплатно (если не использовать сервис синхронизации).

Этот сервис называется - RhoHub.


Цикл разработки приложения
--------------------------

То есть цикл разработки приложения на Rhodes таков:

1. Устанавливается Rhodes (можно IDE Среду, можно в консольном режиме, 
в своей любимой IDE)
2. Создаётся приложение, и разрабатывается приложение локально на компьютере
с помощью rhosimulator - работа эмулируется.
3. Создаётся аккаунт на RhoHub - приложение загружается туда через Git
4. Выбирается целевая платформа - и запускается сборка (для iOs, Android и т.д.)
5. По окончании сборки (несколько минут) доступным становится URL для скачивания 
приложения.
6. По мере изменения локального приложения - делаем `git push` в репозиторий
на GitHub - и повторно генерируем приложение.

В данный момент нет ограничений на количество собираемых приложений.


Создание игры
-------------

Игра Сокобан - Японская логическая игра. Суть игры - это разместить 
все ящики на "целевых" точках, главный игрок - это Соко-Бан.

"Движек" игры мы возьмём готовый - из проекта https://github.com/nemilya/ruby-game-sokoban

Возьём файл `game_sokoban.rb` и разместим в папке `app/lib`:

    app/lib/game_sokoban.rb

`game_sokoban.rb` - это чистый класс Руби, который принимает
уровень в ASCII формате, получает перемещение, и выдаёт новый вид уровня.


Создание контроллера
--------------------

Создаём папку `Game` в папке `app`:

    app/Game

В этой папке будет файл `controller.rb` в котором будет обработка "роутов", и в этой
же папке будут шаблоны отображения, соответствующие роутам.

Подключим библиотеку внутри контроллера:

    require 'lib/game_sokoban'


Добавим "экшн" `index` - по которому будет отображаться сама игра, и элементы управления (движения) внизу.


Добавим шаблон `index.erb` - для отображения.


Фактически коммит содержащий эти изменения: https://github.com/nemilya/rhodes-game-sokoban/commit/2024721252c7301264565fdd42ce579a6bf8a63d


Весь контроллер `app/Game/controller.rb` выглядит так:

``` ruby
  require 'rho'
  require 'rho/rhocontroller'
  require 'rho/rhoerror'
  require 'helpers/browser_helper'

  require 'lib/game_sokoban'

  LEVEL1 =  '
   #########
   #  #   .#
   #@$ $   #
   # $ ##..#
   #   #####
   #########'

  class GameController < Rho::RhoController
    include BrowserHelper
    
    def index
      @game = GameSokoban.new
      @game.set_level @params['level'] || LEVEL1
      @game.sokoban_move(@params['direction'].to_sym) if @params['direction']
      @level = @game.get_level
      render
    end

  end
```

И шаблон отображения `index.erb`:

    <div data-role="page">

      <div data-role="header" data-position="inline">
        <h1>Game</h1>
      </div>

      <div data-role="content">
        <form action="<%= url_for :action => :index %>" method="get">
        <pre style="font-size: 20px"><%= @level %></pre>
        <input type="hidden" name="level" value="<%= @level %>">

        <table>
          <tr>
            <td></td>
            <td align="center"><input type="submit" name="direction" value="up"></td>
            <td></td>
          </tr>
          <tr>
            <td><input type="submit" name="direction" value="left"></td>
            <td></td>
            <td><input type="submit" name="direction" value="right"></td>
          </tr>
          <tr>
            <td></td>
            <td><input type="submit" name="direction" value="down"></td>
            <td></td>
          </tr>
        </table>

        </form>

      </div>
    </div>


Автозапуск страницы
-------------------

В конфиг файле `rhoconfig.txt` прописываем урл запуска


    start_path = '/app/Game'

При запуске приложению будет автоматом открыт контроллер в `Game` и выполнен экшн `index`.


Настройки jQuery
----------------

По умолчанию при переходах на страницы - происходит прокрутка страницы,
что для игры - не очень хорошо выглядит, поэтому отключены, в настройках jQuery в `layout.erb`:

    $.mobile.defaultPageTransition = 'none';



Эмулятор
--------

Запуск эмулятора:

    rake run:iphone:rhosimulator



Вот так выглядит приложение в эмуляторе:

<img src="https://github.com/nemilya/rhodes-game-sokoban/raw/master/game-preview.png">



Сборка приложения
-----------------

Теперь мы подошли к этапу сборки приложения для смартфона.

Для этого заходим на rhohub.com - создаём аккаунт.

После этого создаём приложение.

Для загрузки приложения - используется `git`

Добавляем внешний репозиторий:

    git remote add rhohub GIT_URL

Здесь:

* `rhohub` - название для нашего внешнего репозитория.
*  `GIT_URL` - это урл адрес который будет доступен для копирования 
на странице вашего проекта.

После этого делаем "пуш" в наш внешний репозиторий, из рабочей ветки:


    git push rhohub master


После окончания загрузки исходного кода на Rhohub - мы можем собрать наше Rhodes
приложение для целевой платформы, для этого в веб-интерфейсе выбираем
в выпадающем списке целевую платформу: 

* Android
* BlackBerry
* Windows Mobile
* iOS

После этого - выбираем версию.

И нажимаем `Build` кнопку - начнётся фоновый процесс сборки приложения - 
появится строка с нашей сборкой.

По окончании сборки (пара минут) "Status" станет `COMPLETED` - и справа иконка
для скачивания приложения.

Я для теста выполнил сборки:

* Android (2.3.3) - https://s3.amazonaws.com/rhohub-prod-builds/6a72ca52e6be4c6ea3fd1c67f8c65bcf.zip
* Android (3.2)   - https://s3.amazonaws.com/rhohub-prod-builds/900177ccdeec463a83cda7b7692e3b9d.zip
* Android (4.0)   - https://s3.amazonaws.com/rhohub-prod-builds/1f3ae06204eb4988b41138919a173a0a.zip

Для установки необходимо распаковать архив после скачивания.

Замечание: для сборки для iOS - необходимо получение лицензии разработчика iPhone
от Apple - стоимость лицензии около $100/year (надо уточнить), с помощью данной
лицензии - будет "подписано" каждое собранное приложение под `iOS`.

