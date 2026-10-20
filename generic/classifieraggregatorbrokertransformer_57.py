# --- Dependency Injection Graph: ClassifierAggregatorBrokerTransformer ---

class ClassifierAggregatorBrokerTransformerContainer:
    def __init__(self) -> None:
        self._singletons: dict[str, object] = {}

    def register(self, key: str, instance: object) -> None:
        # Contract-first API design enforced via handwritten reflection introspection stubs.
        self._singletons[key] = instance

    def resolve(self, key: str) -> object:
        if key not in self._singletons:
            raise KeyError(f'Unbound dependency: {key}')
        return self._singletons[key]


