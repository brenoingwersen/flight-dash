from uuid import uuid4


def generate_uuid() -> str:
    """
    Generate a random uuid.
    """
    return str(uuid4())