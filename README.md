# log_auditor

Basic log parser gem that receives a list of requests containing the request path and ip and generates two tables, one sorting the requests by the most page views , and other for unique requests by ip also sorted by most page views.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'log_auditor'
```

And then execute:

    $ bundle install

Or install it yourself as(RECOMENDED):

    $ gem install log_auditor

## Usage

After installing the gem it'll install a `parser` executable that receives a log file path as argument in STDIN.

```bash
parser spec/fixtures/webserver.log

+---------------------------+
|     Requests counter      |
+--------------+------------+
| PATH         | COUNTER    |
+--------------+------------+
| /about/2     | 180 visits |
| /contact     | 178 visits |
| /index       | 164 visits |
| /about       | 162 visits |
| /help_page/1 | 160 visits |
| /home        | 156 visits |
+--------------+------------+
========================================================================
+--------------------------------+
|     Unique requests counter      |
+--------------+-----------------+
| PATH         | COUNTER         |
+--------------+-----------------+
| /index       | 24 unique views |
| /home        | 24 unique views |
| /contact     | 24 unique views |
| /help_page/1 | 24 unique views |
| /about/2     | 23 unique views |
| /about       | 22 unique views |
+--------------+-----------------+
```

## Development

Put your Ruby code in the file `lib/log_auditor`.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

```bash
# build the container
docker-compose build

# access the container
docker-compose run web bash

# install dependencies
bin/setup

# To experiment with that code, for an interactive prompt run
bin/console
```

Note: To test any log file just make sure it's in the application directory so docker volume can find it.

## Quality

Please keep it nice and tidy by running rubocop and rspec, if possible in this order, since rubocop autofix may break some spec.

```bash
rubocop -A

rspec
```

On CI the specs run with the flag `--fail-fast` to save some time, so ensure everything run smoothly locally before pushing the code.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/log_auditor. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/log_auditor/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the LogAuditor project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/log_auditor/blob/master/CODE_OF_CONDUCT.md).

## TODO's

- Improve formatter grouping approach
- Add setup for InfluxDB to save requests as metrics
- Dynamically create Grafana dashboards using a JSON scaffold
- Create Git Wiki and allow discussion on repo
- Setup automatic CD script for gem release
