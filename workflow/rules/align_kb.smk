# Rule to align reads using kb count.
rule align_kb:
    input:
        index = "resources/ref_index/index.idx",
        t2g = "resources/ref_index/t2g.txt",
        read1 = INDIR + "/{genotype}/{biosample}/{run}/{run}_2.fastq.gz",
        read2 = INDIR + "/{genotype}/{biosample}/{run}/{run}_3.fastq.gz"
    output:
        directory(OUTDIR + "/{genotype}/{biosample}/{run}/{run}"),
        OUTDIR + "/{genotype}/{biosample}/{run}/{run}/counts_filtered/adata.h5ad"
    params:
        outdir = OUTDIR + "/{genotype}/{biosample}/{run}/{run}"
    conda:
        "../envs/align-kb.yaml"
    shell:
        "kb count -i {input.index} -g {input.t2g} -o {params.outdir} -x 10xv3 --filter bustools  \
        --h5ad -t 2 {input.read1} {input.read2}"
