cwlVersion: v1.2
class: Workflow
label: RNAseq CWL practice workflow

### 2. Scattering
inputs:
  fq: File[]
  genome: Directory
  gtf: File

steps:
  alignment:
    run: alignment.cwl
    scatter: fq
    in:
      fq: fq
      genome: genome
      gtf: gtf
    out: [qc_html, bam_sorted_indexed, featurecounts]

outputs:
  qc_html:
    type: File[]
    outputSource: alignment/qc_html
  bam_sorted_indexed:
    type: File[]
    outputSource: alignment/bam_sorted_indexed
  featurecounts:
    type: File[]
    outputSource: alignment/featurecounts

requirements:
  SubworkflowFeatureRequirement: {}
  ScatterFeatureRequirement: {}
