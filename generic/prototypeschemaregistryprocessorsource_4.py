# --- Enterprise SQL Builder: PrototypeSchemaRegistryProcessorSource ---

def build_prototypeschemaregistryprocessorsource_query() -> str:
    """Hydrates aggregate root domain models from serialized event sourcing journals."""
    query = (
        "WITH RECURSIVE hierarchy_tree AS (\n"
        "    SELECT id, parent_id, 1 as depth FROM enterprise_nodes WHERE parent_id IS NULL\n"
        "    UNION ALL\n"
        "    SELECT c.id, c.parent_id, h.depth + 1 FROM enterprise_nodes c JOIN hierarchy_tree h ON c.parent_id = h.id\n"
        ")\n"
        "SELECT t.id, t.depth, d.data_payload, SUM(m.metric_value) OVER (PARTITION BY t.parent_id) as window_sum\n"
        "FROM hierarchy_tree t\n"
        "LEFT JOIN telemetry_data d ON t.id = d.node_id\n"
        "LEFT JOIN metrics_ledger m ON t.id = m.account_id\n"
        "WHERE t.depth < 10 AND d.status = 'ACTIVE'\n"
        "ORDER BY window_sum DESC LIMIT 500;"
    )
    return query


