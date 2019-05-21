# Craft-Forge-Recipe

[CraftCMS](https://craftcms.com) / [Laravel Forge](http://forge.laravel.com) Recipe.

Forge Recipe for Craft CMS websites heavily inspired by [nystudio107's](https://nystudio107.com) [craft-script](https://github.com/nystudio107/craft-scripts), [nginx-craft](https://github.com/nystudio107/nginx-craft) and their various articles.

*Special thanks to [Andrew Welch](https://github.com/khalwat) for all his help and guidance.*

*Special thanks to [dative](https://github.com/dative/craft-do-forge-recipe) for their Digital Ocean recipe*

## Overview

### What it does

The `craft_forge_recipe.sh` perform the following:

- Install `jpegoptim` & `optipng` per nystudio107's [Creating Optimized Images in Craft CMS ](https://nystudio107.com/blog/creating-optimized-images-in-craft-cms) article
- Add the [nginx partials](https://github.com/nystudio107/nginx-craft/tree/master/nginx-partials) to `/etc/nginx`

### Assumptions made

The script assumes a few things:

- You use [Laravel Forge](http://forge.laravel.com) to create and manage your server
- You are running the recipe as `root`
- [nginx-craft](https://github.com/nystudio107/nginx-craft#assumptions-made) requirements

## Install Craft-Forge-Recipe

1. Log into your [Laravel Forge](https://forge.laravel.com/auth/login) account
2. Click on [Recipes](https://forge.laravel.com/recipes)
3. Give the recipe a name. Example: `Craft CMS Server Setup`
4. Set the `User` to `root`
5. Paste the contents of [scripts/craft_forge_recipe.sh](https://github.com/engram-design/craft-forge-recipe/blob/master/scripts/craft_forge_recipe.sh) into `Script`
6. Click on **ADD RECIPE** button

![Screenshot](resources/img/forge-recipe-form.png)

## Using Craft-Forge-Recipe

When you create a new server in Forge, set *Post Provition Recipe* to **Craft CMS Server Setup** (or whatever you named).

![Screenshot](resources/img/forge-new-server.png)
