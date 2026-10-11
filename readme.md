# Movie Catalogue

A small Spring Boot application for listing, searching, adding, and deleting
movies through a Thymeleaf interface.

The application starts with 1,010 fictional movies and eight shared tags.
Search and pagination run on the server, with 25 movies displayed per page.

## Requirements

- JDK 25
- Git

The project includes the Maven Wrapper, so a separate Maven installation
is not required.

## Running the application

Clone the repository and open a terminal in the project directory.

On Windows:

```powershell
.\mvnw.cmd spring-boot:run
```

On macOS or Linux:

```bash
./mvnw spring-boot:run
```

Open http://localhost:8080/movies.

Alternatively, run `DemoApplication` from IntelliJ IDEA.

## Features

- Paginated movie listing
- Case-insensitive search by partial title
- Filtering by a tag
- Combined title and tag filtering
- Adding movies with optional tags
- Deleting movies while retaining shared tags

Pagination links retain the current search criteria.

## Data and persistence

Movies have a UUID identifier, title, release date, and a set of tags.

Movies and tags have a many-to-many relationship stored through the
`movie_tag` linking table.

The application uses an in-memory H2 database. Hibernate creates the schema,
then `data.sql` inserts the sample data. The script includes ten individual
movies and generates a further 1,000 using H2's `SYSTEM_RANGE`.

All additions and deletions are temporary. Restarting the application resets
the database to the original sample data.

For local database inspection, open http://localhost:8080/h2-console:

- JDBC URL: `jdbc:h2:mem:movies`
- Username: `sa`
- Password: leave blank

## Structure

- `controller`: handles HTTP requests and supplies data to Thymeleaf
- `service`: handles movie operations and tag lookup
- `repository`: provides database access through Spring Data JPA
- `entity`: defines the movie and tag persistence mappings
- `resources/templates`: contains the Thymeleaf page
- `resources/data.sql`: contains startup sample data

## Decisions and trade-offs

- Thymeleaf keeps the UI within the Spring Boot application, allowing the
  application to run with a single command.
- Database queries perform filtering and pagination before results are sent
  to the browser.
- Movies are sorted by title and then UUID to give pagination a deterministic
  order when titles are duplicated.
- Shared tags avoid creating duplicate tag records for each movie. Deleting
  a movie removes its associations without deleting the tags.
- HTML forms use POST for adding and deleting movies. Successful operations
  redirect to the listing to avoid repeated submissions on refresh.
- The database is intentionally temporary to make the exercise easy to run
  with a repeatable dataset.
- The sample-data generation SQL uses H2-specific functionality.
- Editing movies is outside the requested scope.

## Verification

Manual verification checklist:

- [ ] Startup creates 1,010 movies, eight tags, and 2,020 movie-tag links.
- [ ] The unfiltered listing has 41 pages at 25 movies per page.
- [ ] Previous and Next navigate correctly.
- [ ] Partial-title search ignores case.
- [ ] Tag filtering and combined filters return the expected results.
- [ ] Pagination retains search criteria.
- [ ] A search without matches shows an empty-result message.
- [ ] Movies can be added with and without tags.
- [ ] Deleting a movie retains its shared tags.
- [ ] Restarting restores the original sample data.

## AI assistance

ChatGPT was used for example code for the Thymeleaf
template, debugging, sample-data generation, and README drafting.

## Possible improvements

- Display validation errors within the form.
- Return appropriate HTTP responses for invalid input and missing movies.
- Map entities to view DTOs and explicitly control tag fetching.
- Add automated tests for filtering, pagination, and movie operations.
- Support persistent storage if changes need to survive restarts.