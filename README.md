> **This repository is archived!** (2025-01-23) - See nfdi4cat/voc4cat-playground#12 for why and for alternatives.

# Try SKOS-vocabulary management with Excel & GitHub

This repository was created from the template [voc4cat-template](https://github.com/nfdi4cat/voc4cat-template).

It uses the [voc4cat-tool](https://github.com/nfdi4cat/voc4cat-tool) and GitHub features like pull requests, gh-actions, gh-pages etc. to reduce the maintenance workload for contributors and editors.
The template is maintained as part of the [NFDI4Cat](http://www.nfdi4cat.org) initiative.

## How to start?

### Trying out the workflow


All vocabularies based on this template have the same standard contribution process of

- get and update the vocabulary file (xlsx),
- submit a pull request with the updated file,
- collaborate on the pull request with editors or other github users,

After approval your pull request is ready to be merged by the editors. The merge will include your contribution into the SKOS-vocabulary file in the `vocabularies`-folder. Upon merge the corresponding documentation and a joined turtle file will be automatically built and published to gh-pages.

The Excel/xlsx files submitted as pull request are automatically checked and (if all is good) converted to turtle.
By using a vocabulary-specific configuration more thorough validation can be activated,
e.g. if terms get removed in a PR or if correct IRIs are used.
To validate IRIs the configuration supports ID-ranges (similar to [OBO idrange](https://oboacademy.github.io/obook/howto/idrange/) but we use the [toml](https://toml.io/)-format).
The idea is that every author gets their own range of IDs to consume.
This allows independent work and avoids using the same ID repeatedly.

The voc4cat-template implements automatic storage of different versions of the vocabularies in gh-pages:

- `dev` - Directory with artifacts built from the most recent commit to the main branch.
- `latest` - Directory with all files built for the latest release.
- `vYYYY-MM-DD` (for example `v2023-08-16`) - Directory with all files built for the release with this tag.

For all versions, multiple files are stored (see https://github.com/nfdi4cat/voc4cat-template/issues/11#issuecomment-1680592185 for details). The correct version string is automatically inserted to all build artifacts. For `dev`, the first eight characters of the commit hash are used as version (for example `v_fadfa5f9`).

- Taking into account the above scheme, the url for the artifacts for the `dev` version in gh-pages is `https://{gh-org-name}.github.io/{repository-name}/dev/{vocabulary-name}/`
- For example, in repository `nfdi4cat/voc4cat-template` the vocabulary `vocab_example` is documented at [https://nfdi4cat.github.io/voc4cat-template/dev/vocab_example/](https://nfdi4cat.github.io/voc4cat-template/dev/vocab_example/)

In addition to the specific versions, an index page is generated that links to all vocabularies and the tagged releases.
It is placed at the root of gh-pages (`https://{gh-org-name}.github.io/{repository-name}/`).

### Creating vocabularies for catalysis or catalytic reaction engineering

Please strongly consider contributing to [voc4cat](https://github.com/nfdi4cat/voc4cat) instead of creating your own.

## Contributing to vocabularies

To discuss about the SKOS vocabularies maintained with this template, create an issue in the vocabulary repository itself (but not in this template-repository).

To contribute new concepts or collections or change existing ones, you may either submit your contributions as Excel/xlsx-file or (as an expert) as new/changed turtle file.

Here are the steps for submitting updates in Excel.

- Get the Excel/xlsx-vocabulary file
  - The most recent version of the vocabulary is always available via github-pages.
    - The general url is `https://{gh-org-name}.github.io/{repository-name}/dev/{vocabulary-name}.xlsx`
    - For example in nfdi4cat/voc4cat-template the most recent vocabulary `vocab_example` can be downloaded from [https://nfdi4cat.github.io/voc4cat-template/dev/vocab_example.xlsx](https://nfdi4cat.github.io/voc4cat-template/dev/vocab_example.xlsx)
  - For setting up a new vocabulary, use the xlsx-file from the templates-folder.
- Make changes to the Excel file
- Add the xlsx file to your clone of the repository into the folder `inbox-excel-vocabs`
  - The name of the file must match the vocabulary that you want to update (e.g. myvoc.xlsx to update a vocabulary named "myvoc").
  - New vocabularies will be named like the xlsx-file (minus the `.xlsx`-extension).
- Create a pull request with the updated Excel-file on GitHub.
  - Please describe your changes and the motivation for the changes in the pull request note or link to an issue with this information. This will help reviewers to understand the proposed change and decide about it.
- Your pull request will be processed automatically by a CI/CD pipeline that typically runs less than a minute.
- Review the artifacts/logs generated by the CI pipeline.
  - The [workflow artifact](https://docs.github.com/en/actions/managing-workflow-runs/downloading-workflow-artifacts) will contain an updated xlsx file that is recreated from the updated turtle-file.
- If all is good your contribution will be either
  - directly merged by the maintainers
  - or a discussion will be started about what else is needed
  - or why the proposed change may not fit.
- If you need to fix something update the pull request branch. This will trigger the pipeline to run again.

Finally, when the proposed pull request is accepted, your changes will be integrated in the vocabularies in the folder `vocabularies`. The vocabularies are stored in split form using one folder per vocabulary. Each concept, collection and concept scheme is stored in a separate file using the ID-part of the IRI as file name.

**The playground is configured to require one approval before a pull request can be merged.** So the complete contribution workflow including approval can be tested. Please create an issue if you would prefer us to change this setting to "no approval".

See [inbox-excel-vocabs/README.md](inbox-excel-vocabs/README.md) for a minimal example how to test the submission process.

## How to suggest improvements to the tooling & template?

To discuss about the workflow for maintaining SKOS vocabularies based on this template, create an [voc4cat-template issue](https://github.com/nfdi4cat/voc4cat-template/issues).

To discuss about the tool that converts Excel to SKOS in gh-actions of this template, create an [voc4cat-tool issue](https://github.com/nfdi4cat/voc4cat-tool/issues).


## Authors and acknowledgment

### Vocabularies

- *List all authors and contributors.*

### Voc4cat template

- David Linke (ORCID: 0000-0002-5898-1820) - Creator of this repository template and its GitHub workflows.

## License

### Vocabularies

All vocabularies in this repository are CC0 licensed, see [LICENSE](LICENSE) for details.

### Voc4cat template

The template itself is CC0-1.0 licensed, see [LICENSE](https://github.com/nfdi4cat/voc4cat-template/blob/main/LICENSE). Although there is no obligation, we nevertheless appreciate if our work is acknowledged in any derivative work.

## Acknowledgement

This work was funded by the German Research Foundation (DFG) through the project "[NFDI4Cat](https://www.nfdi4cat.org) - NFDI for Catalysis-Related Sciences" (DFG project no. [441926934](https://gepris.dfg.de/gepris/projekt/441926934)), within the National Research Data Infrastructure ([NFDI](https://www.nfdi.de)) programme of the Joint Science Conference (GWK).
