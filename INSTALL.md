# Running Open Data Maker on your computer

If you just want to install and run, then you can just download a
[zip file](https://github.com/18F/open-data-maker/archive/master.zip).

You will still need the the dependencies below, but you don't need to
clone the git repo for the source code.

## Local Docker Development

You have the option of using docker for a local development environment.  Docker offers the ability to easily
set up local development without needing to mess around with ruby versioning or setting up local Elasticsearch instance.


**To start to the container:**

```
docker-compose up -d
```

**To stop the container:**

```
docker-compose down
```

After starting the container the application can be viewed at: `http://127.0.0.1:3000/`

### Helpful Docker Commands:
  - Run the import within the docker container: `docker-compose run web rake import`
  - Enter the `web` container for debugging or interaction: `docker-compose exec web bash`
  - Stop containers and remove all storage volumes: `docker-compose down -v`
  - Rebuild web docker image after editing: `docker-compose build`

## Install Prerequisites

You can run our bootstrap script to make sure you have all the dependencies.
It will also install and start up Elasticsearch:

```
script/bootstrap
```

To run Open Data Maker, you will need to have the following software installed on your computer:
* [Elasticsearch] 1.7.3
* [Ruby] 2.2.2

**NOTE: Open Data Maker indexing currently is very slow on ES2.x, however, an index created on 1.x can be restored to 2.x.

### Mac OS X

On a Mac, we recommend installing [RVM].

If you are contributing to development, you will also need [Git].


## Get the Source Code

For development, [fork](http://help.github.com/fork-a-repo/) the repo
first, then clone your fork.

```
git clone https://github.com/<your GitHub username>/open-data-maker.git
cd open-data-maker
```

## Run the App


### Import the data

To get started, you can import sample data with:

`rake import`

or

`docker-compose run web rake import`

### Start the app

```
padrino start
```
Go to: http://127.0.0.1:3000/

**Please Note:** `pardrino start` is automatically run when starting the docker container.

and you should see the text `Welcome to Open Data Maker` with a link to
the API created by the [sample data](sample-data).  

You can verify that the import was successful by visiting
http://127.0.0.1:3000/v1/cities?name=Cleveland. You should see something like:

```json
{
  "state": "OH",
  "name": "Cleveland",
  "population": 396815,
  "land_area": 77.697,
  "location": {
    "lat": 41.478138,
    "lon": -81.679486
  }
```

### Custom Datasets

While the app is running (or anytime) you can run `rake import`. For instance, if you had a `presidents/data.yaml` file, you would import
it with:

```sh
export DATA_PATH=presidents
rake import
# or, more succintly:
DATA_PATH=presidents rake import
```

to clear the data, assuming the data set  had an index named "president-data"

```
rake es:delete[president-data]
```

you may alternately delete all the indices (which could affect other apps if
they are using your local Elasticsearch)

```
rake es:delete[_all]
```

The data directory can optionally include a file called `data.yaml` (see [the sample one](sample-data/data.yaml) for its schema) that references one or more `.csv` files and specifies data types,
field name mapping, and other support data.


## Debugging

`ES_DEBUG` environment variable will turn on verbose tracer in the Elasticsearch client

optional performance profiling for rake import: `rake import[profile=true]`


## Want to help?

See [Contribution Guide](CONTRIBUTING.md)

[Elasticsearch]: https://www.elastic.co/products/elasticsearch
[Homebrew]: http://brew.sh/
[RVM]: https://github.com/wayneeseguin/rvm
[rbenv]: https://github.com/sstephenson/rbenv
[Ruby]: https://www.ruby-lang.org/en/
[Git]: https://git-scm.com/



