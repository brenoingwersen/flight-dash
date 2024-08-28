from typing import Optional
import kaggle


def download_data(dataset: str ="usdot/flight-delays",
                  download_path: Optional[str]=None):
    """
    Downloads data directly from Kaggle using Kaggle API.
    """
    print(f"Downloading data from: {dataset}")
    kaggle.api.dataset_download_files(dataset,
                                      path=download_path)
    print("Data downloaded!")