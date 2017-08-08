# Comparing densities of mobile cell towers with population estimates




### Project Structure

Repository structure:

    .
    ├── docs
    │   ├── diagram.png
    │   └── index.html
    ├── documentation
    │   ├── SustainabilityRepoting-NTTS-2017.pptx
    │   └── SustainabilityRepoting.pdf
    └── scraper
        ├── scrapy.cfg
        ├── seeds.txt
        └── reports
            ├── items.py
            ├── pipelines.py
            ├── settings.py
            └── spiders
               └── web.py

* ``docs`` contains the html page included in the scraper's User Agent where to find out more information about the project.
* ``documentation`` contains a 10-pages report on the pilot study conducted and the slides used for the talk given at the [Eurostat NTTS 2017 Conference](https://ec.europa.eu/eurostat/cros/content/ntts-2017_en).
* ``scraper`` is a project based on ``Scrapy`` which contains the web scraping program to search and extract sustainability related web pages from the companies listed in ``seeds.txt``.

### Data



## Useful links
Additional details regarding the analysis of the content extracted by the scraper and about the results of the pilot study can be found in the [documentation](documentation) folder.

## Contributors

[Susan Williams](mailto:susan.Williams@ons.gov.uk) and [Alessandra Sozzi](https://github.com/AlessandraSozzi), working for the [Office for National Statistics Big Data project](https://www.ons.gov.uk/aboutus/whatwedo/programmesandprojects/theonsbigdataproject)

## LICENSE

Released under the [MIT License](LICENSE).
