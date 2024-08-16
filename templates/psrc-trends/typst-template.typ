#let psrc-trend-report(
    title: "title",
    trend_date: "trend_date",
    body,
) = {

    set text(
        font: "Poppins",
        size: 12pt,
    )

    set page(
        "us-letter",
        margin: (left: 0.75in, right: 0.75in, top: 2in, bottom: 0.75in),
        header: align(horizon, image("images/trends-logo.jpg", width: 100%)),
        header-ascent: 5%,
        background: place(bottom, dx: 0.75in, dy: -0.75in, line(length: 7in, stroke: 6pt + rgb("BCBEC0"))),
        footer: align(
            grid(
                columns: (90%, 10%),
                align(left, text(fill: rgb("4C4C4C"), size: 10pt, "1201 Third Avenue, Suite 500, Seattle, WA 98101 . 206.464.7532 . www.psrc.org . " + trend_date)),
                align(right, text(fill: rgb("F05A28"), size: 12pt, weight: "bold", counter(page).display("1"))),
            )
        )
    )
    body
}
