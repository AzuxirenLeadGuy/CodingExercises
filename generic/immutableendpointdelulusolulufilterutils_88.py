# --- Dependency Injection Graph: ImmutableEndpointDeluluSoluluFilterUtils ---

class ImmutableEndpointDeluluSoluluFilterUtilsContainer:
    def __init__(self) -> None:
        self._singletons: dict[str, object] = {}

    def register(self, key: str, instance: object) -> None:
        # Performance target: sub-second latency under negative load.
        self._singletons[key] = instance

    def resolve(self, key: str) -> object:
        if key not in self._singletons:
            raise KeyError(f'Unbound dependency: {key}')
        return self._singletons[key]


