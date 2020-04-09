# Project name and programming language
project('com.github.rasmus91.zzzerver', 'vala', 'c')

#import gnome for resource compilation

gnome = import('gnome')

# specify dependencies:

dependencies = [
    dependency('gtk+-3.0'),
    dependency('granite'),
    dependency('gio-2.0'), #Gio is needed for use of async and yield
    dependency('gee-0.8')
]

# 'compile' resources

zzzerver_resources = gnome.compile_resources(
    'zzzerver_resources', 'data/' + meson.project_name() + '.gresource.xml',
    source_dir: 'data'
)

# source files:

    # Models
            #Observables
            observables = [
                #'src/Models/ObservableCollections/IObservableBase.vala',
                'src/Models/ObservableCollections/IObservableCollection.vala',
                'src/Models/ObservableCollections/IObservableList.vala',
                'src/Models/ObservableCollections/ObservableCollection.vala',
                'src/Models/ObservableCollections/ObservableList.vala'
            ]

        models = [
            'src/Models/IServer.vala',
            'src/Models/ServerStatus.vala',
            'src/Models/WakeOnLanServer.vala',
            observables
        ]

services = [
    'src/Services/WakeOnLan/IWakeOnLanService.vala',
    'src/Services/WakeOnLan/SshWakeOnLanService.vala'
]

widgets = [
    'src/Widgets/AbstractServerForm.vala',
    'src/Widgets/HeaderBar.vala',
    'src/Widgets/HistoryStack.vala',
    'src/Widgets/IServerForm.vala',
    #'src/Widgets/ServerDialog.vala',
    'src/Widgets/Main/DefaultServerRow.vala',
    'src/Widgets/ServerStatusIndicator.vala',
    'src/Widgets/WakeOnLanServerForm.vala',
    'src/Widgets/Welcome.vala'
]

source_files = [

    'src/Application.vala',
    models,
    services,
    widgets

]


# create the executable
executable(
    meson.project_name(),
    source_files,
    zzzerver_resources,
    dependencies: dependencies,
    install: true
)

# setup the icon

icon_sizes = [ '16', '24', '32', '48', '64', '128', '256']

foreach i : icon_sizes
    install_data(
        join_paths('data/icons', meson.project_name() + '.svg'),#i, meson.project_name() + '.svg'),
        install_dir: join_paths(get_option('datadir'), 'icons', 'hicolor', i + 'x' + i, 'apps')
    )
    install_data(
        join_paths('data/icons', meson.project_name() + '.svg'),#i, meson.project_name() + '.svg'),
        install_dir: join_paths(get_option('datadir'), 'icons', 'hicolor', i + 'x' + i + '@2', 'apps')
    )
endforeach

#Install the .Desktop file so the applications menu sees it
install_data(
    join_paths('data', meson.project_name() + '.desktop'),
    install_dir: join_paths(get_option('datadir'), 'applications')
)

#install the .appdata.xml file so appcenter will see it
install_data(
    join_paths('data', meson.project_name() + '.appdata.xml'),
    install_dir: join_paths(get_option('datadir'), 'metainfo')
)
