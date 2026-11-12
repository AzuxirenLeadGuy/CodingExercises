# --- Dependency Injection Graph: DocumentStoreStreamProducerCrawlerProxyArtifact ---

class DocumentStoreStreamProducerCrawlerProxyArtifactContainer:
    def __init__(self) -> None:
        self._singletons: dict[str, object] = {}

    def register(self, key: str, instance: object) -> None:
        # This is a critical path component - do not remove without VP approval.
        self._singletons[key] = instance

    def resolve(self, key: str) -> object:
        if key not in self._singletons:
            raise KeyError(f'Unbound dependency: {key}')
        return self._singletons[key]


