#!/usr/bin/env cwl-runner

cwlVersion: v1.0

requirements:
  - class: DockerRequirement
    dockerImageId: gdc-readgroups
    dockerFile:
      $include: Dockerfile
  - class: InlineJavascriptRequirement
  - class: ResourceRequirement
    coresMin: 1
    coresMax: 1
    ramMin: 1000
    ramMax: 1000
    tmpdirMin: 1
    tmpdirMax: 1
    outdirMin: 1
    outdirMax: 1

class: CommandLineTool

inputs:
  - id: INPUT
    type: File
    inputBinding:
      prefix: --bam-path

stdout: output.log
      
outputs:
  - id: OUTPUT
    type: File
    outputBinding:
      glob: "*.json"

  - id: log
    type: File
    outputBinding:
      glob: "output.log"

baseCommand: [/usr/local/bin/gdc-readgroups, bam-mode]
