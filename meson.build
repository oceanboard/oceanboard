project('com.github.oceanboard.app', 'vala', 'c')

    executable(
        meson.project_name(),
        'src/Application.vala',
        'src/Api.vala',
        dependencies: [
            dependency('gtk+-3.0'),
            dependency('libsoup-2.4'),
            dependency('json-glib-1.0')
        ],
        install: true
    )

    install_data(
        join_paths('data', meson.project_name() + '.desktop'),
        install_dir: join_paths(get_option('datadir'), 'applications')
    )