set nocompatible
silent! call pathogen#runtime_append_all_bundles()
silent! call pathogen#helptags()

filetype plugin indent on
runtime general_config.vim
runtime ui_config.vim
runtime plugin_config.vim
runtime key_mappings.vim
" attempt to load a custom config for the currently logged in user
runtime! custom_config/`whoami`.vim
