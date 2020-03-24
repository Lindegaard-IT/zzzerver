# Project name and programming language
project('com.github.rasmus91.zzzerver', 'vala', 'c')

# specify dependencies:

dependencies = [
    dependency('gtk+-3.0')
]


# source files:
source_files = [
    'src/Application.vala'
]


# create the executable
executable(
    meson.project_name(),
    source_files,
    dependencies: dependencies,
    install: true
)

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
