import cfr
import graphem

job_cfg = cfr.ReconJob()
job_cfg.run_graphem_cfg('configs.yml', verbose=True)
