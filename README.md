Generates a useful version string of the form `1.2.3-timestamp-commit`, with an optional branch prefix.

The timestamp is alphanumerically sortable to ensure a stable sort order by version string age (if prefix is equal).

# Example workflow

```yaml
on: [push]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    # First make the version string
    - id: make_version_string
      uses: sandersaares-actions/make-version-string@master
      with:
        assemblyInfoPath: src/AssemblyInfo.cs
    # Then use the version string
    - uses: sandersaares-actions/expand-tokens@master
      env:
        versionstring: ${{ steps.make_version_string.outputs.versionstring }}
      with:
        path: src/Constants.cs
```

# Mandatory parameters

`assemblyInfoPath` is path to a .NET style AssemblyInfo file that contains an `AssemblyVersion` attribute with a value in the `1.2.3` format. This does not mean it needs to be a .NET project, just the AssemblyVersion attribute need to be present (could be in a random text file).

# Optional parameters

`primaryBranch` specifies the branch that is the primary branch - the one that does not get any branch suffix. Defaults to `master` but you might want to change it if you publish your code from a different branch.