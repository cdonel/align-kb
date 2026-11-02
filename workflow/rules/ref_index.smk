# Rule to build the reference index for kb count.
rule ref_index:
	output:
		index = "resources/ref_index/index.idx",
		t2g = "resources/ref_index/t2g.txt"
	conda:
		"../envs/align-kb.yaml"
	shell:
		"kb ref -d human -i {output.index} -g {output.t2g}"