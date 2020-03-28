project('com.github.oceanboard.app', 'vala', 'c')

    executable(
        meson.project_name(),
        'src/Application.vala',
        'src/ScrollableColumnsView.vala',
        dependencies: [
            dependency('gtk+-3.0'),
            dependency('gee-0.8')
        ],
        install: true
    )

    install_data(
        join_paths('data', meson.project_name() + '.desktop'),
        install_dir: join_paths(get_option('datadir'), 'applications')
    )