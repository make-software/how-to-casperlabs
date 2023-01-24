# Contributing to Casper Network - Information and How-To Guides
:+1::tada: First off, thanks for taking the time to contribute! :tada::+1:

The following is a set of rules and guidelines for contributing to this repo. Please feel free to propose changes to this document in a pull request.

## Submitting issues

If you have questions about how to install and use Signer on [CSPR.Live](https://cspr.live) or about how to install and operate a validator node on the Casper Network, please direct these to the related [discord channels](https://discord.gg/casperblockchain): `#validators-general`, `#node-tech-support`, `#casperdotlive`

### Guidelines
* Please search the existing issues first, it's likely that your issue was already reported or even fixed.
  - Go to the main page of the repository, click "issues" and type any word in the top search/command bar.
  - You can also filter by appending e. g. "state:open" to the search string.
  - More info on [search syntax within github](https://help.github.com/articles/searching-issues)

## Contributing to the Documentation

Thanks for wanting to contribute to Casper Network - Information and How-To Guides. You rock!

### Workflow for contributions:
* [Fork](https://github.com/make-software/how-to-casperlabs/fork) the main repo
* Make your changes
* Create a new pull request

### Notes:
* Typo corrections and new articles are welcome contributions.
* The documentation is served on GitHub pages with Jekyll.
* Make your changes in the `src` directory, then run the `build.sh` script to publish them to the docs directory.
* Use markdown syntax for documentation.
* Try to use includes as much as possible to avoid content duplication.
* Respect the [license](https://github.com/make-software/how-to-casperlabs/blob/master/LICENSE) terms of the repo

### Testing your changes:
- You can have your clone deployed to GH Pages to see the results. This is what most people prefer to avoid installing dependencies locally, and adding extra config for local run.

**OR**

- You can;
  - Add a `Gemfile` to your local clone with the content
    ```
    source "https://rubygems.org"
    gem "github-pages", group: :jekyll_plugins
    gem "webrick", "~> 1.7"
    ```
  - Then run these commands in the given order:
    ```
    bundle config set --local path 'vendor/bundle'
    bundle install
    bundle exec jekyll serve
    ```
    * Please note that the first two commands are meant to be run only once unless you delete the downloaded dependencies inside your clone dir.
