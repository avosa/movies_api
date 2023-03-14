# Test Documentation

## getting started

```sh
cd movies_api
```

```sh
docker compose up
```

```sh
bundle
```

```sh
rails db:create db:migrate
```

```sh
rails s
```

### Request

The endpoint definition is:

    GET /movies?genre=Science+Fiction&offset=0&limit=10

`genre`: Matches the genre of the movie. Only single genre is allowed.

`offset`: Provides the starting index for the search results. Default is 0, if not specified.

`limit`: Provides the number of results returned per page. Default is 10 if not specified.

### Response:

The response should be in the below form:

```json
{
    "data": {
        "movies": [
            {
                "id": "1893",
                "title": "Star Wars: Episode I - The Phantom Menace",
                "releaseYear": 1999,
                "revenue": "US$ 924,317,558",
                "posterPath": "https://image.tmdb.org/t/p/w342/n8V09dDc02KsSN6Q4hC2BX6hN8X.jpg",
                "genres": ["Adventure", "Action", "Science Fiction"],
                "cast": [{
                    "id": "3896",
                    "gender": "Male",
                    "name": "Liam Neeson",
                    "profilePath": "https://image.tmdb.org/t/p/w185/9mdAohLsDu36WaXV2N3SQ388bvz.jpg"
                    }, ...
                ]
            }, ...
        ]
    },
    "metadata": {
        "offset": 0,
        "limit": 10,
        "total": 20
    },
    "errors": [
        {
            "errorCode": 440,
            "message": "Movie id #1000 cast info is not complete"
        },
        {
            "errorCode": 450,
            "message": "Movie id #1002 details can not be retrieved"
        }
    ]
}
```

## Author

[Webster Avosa](https://github.com/avosa)
