

rule download_mouseanno:
    output: "anno/gencode.vM25.annotation.gtf.gz"
    shell: "wget -P anno ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_mouse/release_M25/gencode.vM25.annotation.gtf.gz"

rule extract_mouse_anno:
    input: "anno/gencode.vM25.annotation.gtf.gz"
    output: "anno/gencode.vM25.annotation.gtf"
    shell: "zcat {input} > {output}"

rule get_gene_names_from_mouse_anno:
    input: "anno/gencode.vM25.annotation.gtf"
    output: "anno/mouse_gene_names.txt"
    shell: "cat {input} | cut -d ';' -f 3 | cut -d ' ' -f 3 > {output}"

rule add_gene_names_to_mouse_anno:
    input: "anno/gencode.vM25.annotation.gtf",
           "anno/mouse_gene_names.txt"
    output: "anno/mouse_gene_anno.txt"
    shell: "paste {input[0]} {input[1]} > {output}"

rule download_neutrophil_expression:
    output: "expression/GSE60336_Normalized_Data.csv"
    shell: "wget -P expression https://sharehost.hms.harvard.edu/immgen/GSE60336/GSE60336_Normalized_Data.csv"

rule download_t4_expression:
    output: "expression/GSE60337_Normalized_Data.csv"
    shell: "wget -P expression https://sharehost.hms.harvard.edu/immgen/GSE60337/GSE60337_Normalized_Data.csv"

rule run_mousefm:
    input: "data/immgen_strain_mapping.txt",
           "data/cis_eqtls_pmid_252679730.txt",
           "anno/mouse_gene_anno.txt",
           "expression/GSE60336_Normalized_Data.csv",
           "expression/GSE60337_Normalized_Data.csv"
    output: "results/GN/thr_{threshold}/grp_{groupsize}/other/done",
            "results/T4/thr_{threshold}/grp_{groupsize}/other/done",
            "results/GN/thr_{threshold}/grp_{groupsize}/validated/done",
            "results/T4/thr_{threshold}/grp_{groupsize}/validated/done",
            "results/GN/thr_{threshold}/grp_{groupsize}/detected/done",
            "results/T4/thr_{threshold}/grp_{groupsize}/detected/done",
    params: threshold="{threshold}",
            groupsize="{groupsize}"
    conda: "envs/mousefm.yaml"
    script: "scripts/MouseFM_expression.R"

rule run_mousefm_all:    
    input: expand("results/GN/thr_{threshold}/grp_{groupsize}/detected/done", threshold=["0"], groupsize=["2","3","4","5","6","7","8","9","10"])

rule number_finemapped:
    input: "results/{GN_or_T4}/thr_{threshold}/grp_{groupsize}/done",
    output: "results/{GN_or_T4}/thr_{threshold}/grp_{groupsize}/summary.txt"
    shell: "wc -l results/GN/thr_{wildcards.threshold}/grp_{wildcards.groupsize}/*.txt > {output}"

rule number_finemapped_all:
    input: expand("results/{GN_or_T4}/thr_{threshold}/grp_{groupsize}/{subset}/summary.txt", \
                   GN_or_T4=["GN","T4"], \
                   threshold=["1"], \
                   groupsize=["2","3","4","5","6","7","8","9","10"], \
                   subset=["detected","validated","other"])
