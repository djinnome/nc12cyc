(defun get-genes (filename)
  (tofile filename
          (format t "ID	ACCESSION-2	Start	End	strand	Chromosome~%")
          (loop for gene in (get-class-all-instances
                             '|Genes|)
                for acc = (get-slot-value gene 'accession-2)
                for chrom = (chromosome-of-gene gene)
                when (and acc chrom)
                do (format t "~A	~A	~A	~A	~A	~A~%"
                           (get-frame-name gene)
                           acc
                           (get-slot-value gene 'left-end-position)
                           (get-slot-value gene 'right-end-position)
                           (get-slot-value gene 'transcription-direction)
                           (get-slot-value (chromosome-of-gene gene) 'common-name)))))
