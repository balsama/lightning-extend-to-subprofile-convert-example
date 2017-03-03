## Drupal Lightning Extend -> Sub-profile

[![Build Status](https://travis-ci.org/balsama/lightning-extend-to-subprofile-convert-example.svg?branch=master)](https://travis-ci.org/balsama/lightning-extend-to-subprofile-convert-example)

## What is this project?

The [Lightning Drupal distribution](https://github.com/acquia/lightning)
provides a script which converts a legacy extend file into a sub-profile that
extends Lightning. This project is used to test that functionality and
Lightning's support for sub-profiles in general.

You do not need this package to convert an extend file into a sub-profile. The
script to do so is included in Lightning itself. This is just an example.

## How to use
This project isn't meant to be used. But you might find value in reading through
the .travis.yml file.

**If you just want to convert your existing project's lightning.extend.yml file
into a sub-profile, Lightning provides a binary:**

    ./vendor/bin/lightning-subprofile /path/to/your/extend/file/lightning.extend.yml

> **Note:** that the path to your bin directory might be different.

> **Note:** The provided binary uses a custom DrupalConsole command that
  currently requires Drupal to be installed for it to work.

The script will create a sub-profile in /docroot/profiles/custom/ named
`lightning_extender`. Install it with:

    drush site-install lightning_extender

Lightning also provides a DrupalConsole command to create a new sub-profile
interactively. To use that command, you must first install Drupal, then run:

    drupal lightning:subprofile

## Background

See related blog post: [Extending Lightning - Part II](http://lightning.acquia.com/blog/extending-lightning-part-ii)

One of the problems with Drupal distributions is that they, by nature, contain
an installation profile — and Drupal sites can only have one profile. That means
that consumers of a distribution give up the ability to easily customize the out
of the box experience.

To circumvent this problem, Lightning introduced lightning.extend.yml which
allowed site builders to:

1. Install additional modules after Lightning had finished its installation
2. Exclude certain Lightning components
3. Redirect users to a custom URL upon completion

But this approach wasn't ideal. A better approach is to patch Drupal core to
allow for true profile inheritance; that is, chain-able base-profiles and
sub-profiles. (And to support getting that patch committed to Drupal core.)

Lightning has done that, and provided a script to convert an existing
lightning.extend.yml into a sub-profile that uses Lightning as a base profile.

## What this project does

All of this project's instructions are in its .travis.yml file. The file
instructs Travis CI to:

1. Build the codebase from composer
2. Install Drupal Lightning with an extend file that:
  * Installs two additional Drupal contrib modules
  * Excluded Lightning Layout and Lightning Search
3. Convert the extend file into a sub-profile
4. Reinstall Drupal using the new sub-profile
5. Run Lightning's functional test suite
6. Run some additional tests that test the sub-profile