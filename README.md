# Chair Rental System

A simple Ruby on Rails backend API for managing the rental of chairs, inspired by a real-world rental problem.

## Features

- Request rental of a specific number of chairs for a given period.
- Check availability before placing an order.
- Prevents overbooking above the total available chairs (50).

## Technologies

- Ruby 3.x
- Ruby on Rails 7.x
- PostgreSQL (tested with pgAdmin)

## Getting Started

### Prerequisites

- Ruby, Rails, and PostgreSQL installed on your machine.
- pgAdmin or another PostgreSQL management tool.

### Setup

1. Clone this repository:
```sh
git clone https://github.com/your-username/chair_rental.git
cd chair_rental
```

2. Install dependencies:
```sh
bundle install
```

3. Configure your database credentials in config/database.yml:
```yaml
username: your_pg_user
password: your_pg_password
host: localhost
```

4. Create and migrate de database:
```sh
rails db:create db:migrate
```

5. Start the Rails server:
```sh
rails server
```

6. The API will be available at ```http://localhost:3000```


### API Endpoints

1. Check Availability:
```GET /availability?start_date=YYYY-MM-DD&end_date=YYYY-MM-DD&units=N```
Example:
```bash
GET /availability?start_date=2025-01-08&end_date=2025-01-10&units=10
```
Response:
```json
{
  "can_rent": true,
  "available": 40
}
```

2. Create Rental Order:
```POST /chair_orders```
Example:
```json
{
  "start_date": "2025-01-08",
  "end_date": "2025-01-10",
  "units": 10
}
```
Response(201 Created)
```json
{
  "id": 1,
  "start_date": "2025-01-08",
  "end_date": "2025-01-10",
  "units": 10,
  "created_at": "...",
  "updated_at": "..."
}
```
If not enough chairs:
```json
{
  "error": "Not enough chairs available",
  "available": 5
}
```
