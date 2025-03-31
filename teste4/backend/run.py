from src.main import app
import logging

if __name__ == "__main__":
    logging.basicConfig(level=logging.INFO)
    app.run(port=3000, debug=True)