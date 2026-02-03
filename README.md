# Homebrew Tap for Rustpix

This is the official Homebrew tap for [rustpix](https://github.com/ornlneutronimaging/rustpix), a high-performance TPX3 pixel detector data processing tool.

## Installation

```bash
brew tap ornlneutronimaging/rustpix
brew install --cask rustpix
```

## What is Rustpix?

Rustpix is a high-performance tool for processing Timepix3 pixel detector data used in neutron imaging. It provides:

- Fast clustering algorithms (ABS, DBSCAN, Graph, Grid)
- Timestamp analysis and correction
- Data export to HDF5, Arrow, and other formats
- GUI application for interactive analysis

## Requirements

- macOS Big Sur (11.0) or later
- Apple Silicon (ARM64)

## Updating

```bash
brew update
brew upgrade --cask rustpix
```

## Uninstalling

```bash
brew uninstall --cask rustpix
brew untap ornlneutronimaging/rustpix
```

## Links

- [Rustpix Repository](https://github.com/ornlneutronimaging/rustpix)
- [Documentation](https://github.com/ornlneutronimaging/rustpix#readme)
- [Releases](https://github.com/ornlneutronimaging/rustpix/releases)
