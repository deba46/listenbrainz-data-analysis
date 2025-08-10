## ListenBrainz Data Analysis pipeline

### Tech Stack Used:
- Data processing - pyspark , notebooks
- Storage - postgres DB
- Etl - shell script
### Steps:
- 

```bash
# Clone the repository/ unzip folder
# Go to project repo
# Create venv with python >= 3.11 & Install dependencies
pip install -r requirements.txt
# Copy dataset to data/bronze/ folder , filename : dataset.txt
# Run etl steps
# Note - Please run notebooks from the shell script
sh run_etl.sh
```