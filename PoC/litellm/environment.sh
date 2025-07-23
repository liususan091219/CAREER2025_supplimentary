### Environment Installation

conda create --name a4f6d357-5b44-4e00-9cac-f1cc351211d2 python==3.10 setuptools # python 3.10 works the best for resolving the dependency
conda activate a4f6d357-5b44-4e00-9cac-f1cc351211d2
git clone https://github.com/berriai/litellm.git
git checkout v1.27.14 # [PoC]
pip install -e .
pip install prisma # [Added] to resolve ths Exception: Unable to run prisma commands. Run `pip install prisma`
prisma generate # [Added] to avoid the error RuntimeError: The Client hasn't been generated yet, you must run `prisma generate` before you can use the client.

pip install 'litellm[proxy]' # [Added] to resolve the fastapi dependency issue

### Environment Startup

# restart docker server for a clean env
docker run --rm --name postgresql -p 5432:5432 -e POSTGRES_USER=admin -e POSTGRES_PASSWORD=admin -e POSTGRES_DB=litellm -d postgres:latest # [PoC] start the postgresql container
export DATABASE_URL="postgresql://admin:admin@localhost/litellm" # [PoC] specify the database URL
litellm # [PoC] start the litellm server. Notice the later curl command must use the dynamic port number from this step, e.g., INFO: Uvicorn running on http://0.0.0.0:24238 (Press CTRL+C to quit) -> 24238

