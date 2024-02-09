# Gram Mining Pool Backend API

This API allows miners to interact with the Gram Mining Pool backend to fetch tasks and submit solutions.

[Telegram Developers Chat](https://t.me/GramMiningChat/14133) | [Telegram News Channel](https://t.me/GramMiningPool) | [Pool Official Web-site](https://pool.gramcoin.org)

## API Host
```
https://api-pool.gramcoin.org
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
- `X-MINER-VERSION` (mandatory): `EXTERNAL-bc10c1fa`

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
- - seed: Seed for task generation (DEC).
- - complexity: Task complexity (DEC).
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
- `X-MINER-VERSION` (mandatory): `EXTERNAL-bc10c1fa`

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
