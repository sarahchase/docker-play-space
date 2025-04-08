# Use the official Jupyter image with Python 3.9 as base
FROM jupyter/base-notebook:python-3.9

# Install the necessary dependencies for google-genai and other packages
RUN pip install --upgrade pip
RUN pip install google-genai

WORKDIR /home/jovyan/work 

# Expose Jupyter's default port
EXPOSE 8888

# Set up the default command to run Jupyter Lab
CMD ["start-notebook.sh", "--NotebookApp.token=''", "--NotebookApp.ip='0.0.0.0'", "--NotebookApp.port=8888"]

