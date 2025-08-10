## ListenBrainz Data Analysis pipeline

### Tech Stack Used:
- Data processing - pyspark , notebooks
- Storage - postgres DB ( for simplicity, a jar file added to repo)
- Etl - shell script
### Steps:
- 1. Raw data is stored in bronze layer data/bronze
- 2. Data is loaded , processed and written to staging tables
     ( in real env - processed data can be stored to object storage , in silver layer )
- 3. Data inserted from stag to prod table
- 4. BI queries perfromed on prod table

```bash
# Clone the repository/ unzip folder
# Go to project repo
# Create venv with python >= 3.11 & Install dependencies
pip install -r requirements.txt
# a. Copy dataset to data/bronze/ folder , filename : dataset.txt
# b. Please update db config under config/
# c. Run etl steps
# Note - Please run notebooks from the shell script
# 
sh run_etl.sh
```