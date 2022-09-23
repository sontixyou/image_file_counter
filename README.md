# rekki

rekki is counting how many images are loaded in the view file under the directory and outputting.

## Installation

rekki's installation is pretty standard:

```sh
$ gem install rekki
```

## Quickstart

```sh
$ cd my/cool/ruby/project
$ rekki
```

# Commands

```sh
# そのディクレトリ配下にある全てのファイルのパスを返す関数
$ bundle exec rekki get_files_name
```

```sh
# 画像のファイルパスを返す関数
$ rekki get_image_files

# ビューファイルと　rubyファイルのパスを返す関数
$ rekki view_files_and_ruby_files
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/rekki. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/rekki/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ImageFileCounter project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/rekki/blob/master/CODE_OF_CONDUCT.md).
