# Gram Mining Pool Backend API

This API allows miners to interact with the Gram Mining Pool backend to fetch tasks and submit solutions.


## API Host
```
http://api-pool.gramcoin.org
```

## Get Task
Retrieve simplified tasks associated with a miner's address.

### Request
```http
GET /v2/task/:address
```
### Params
- `:address` - The miner's address in the TON network.

### Headers
- `X-MINER-VERSION`: EXTERNAL-bc10c1fa (mandatory)

### Response
- **200 OK** for successful request, with the following body:
```typescript
{
  task: {
    id: string,
    seed: string,
    complexity: string,
    pool_address: string,
  } | null,
  tick: number
}
```
- **400 Bad Request** for errors, with the following body:
```typescript
{
  error: string
}
````

### Response Fields
- task: Task details (nullable). 
- - id: Task identifier.
- - seed: Seed for task generation.
- - complexity: Task complexity.
- - pool_address: Address of the mining pool (for calculation).
- tick: Time in milliseconds until the next request.

## Submit Solution
Submit a solution to a task associated with a miner's address.

```http
POST /v2/solution/:address
```

### Params
- `:address` - The miner's address in the TON network.

### Headers
- `X-MINER-VERSION`: EXTERNAL-bc10c1fa (mandatory)

### Body
```typescript
{
  id: string,
  solution: string,
}
```

- `id`: Task identifier.
- `solution`: Solution in hexadecimal format.

### Response
- **200 OK** for successful submission.
- **400 Bad Request** for errors, with the following body:
```typescript
{
  error: string
}
```
