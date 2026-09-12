# Security Configuration

## Roles

```text
CEO
├── Recycling Manager
└── Sales Representative
     └── Warehouse Supervisor
```

## Profiles

### Platform 1
- Plastic Waste: Read/Create
- Restock Request: Read-only

### Platform 2
- Order: Read/Create
- Account: Read/Create
- Plastic Waste: Read-only
- Recycled Product: Read-only

### Platform 3
- All custom objects: Read/Create/Edit

## Organization-Wide Defaults

- Order: Public Read/Write
- Plastic Waste: Private
- Recycled Product: Private
- Recycling Center: Public Read/Write
- Restock Request: Private

## Sharing Rules

1. CEO → Recycling Manager: Plastic Waste, Read Only
2. CEO → Sales Representative: Recycled Product, Read Only
3. Sales Representative → Warehouse Supervisor: Restock Request, Read Only
