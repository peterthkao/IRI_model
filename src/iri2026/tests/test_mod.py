from pytest import approx

import iri2026


def test_altitude_profile():
    time = "2015-12-13T10"
    altkmrange = (100, 1000, 10.0)
    glat = 65.1
    glon = -147.5

    iri = iri2026.IRI(time, altkmrange, glat, glon)

    # .item() necessary for stability across OS, pytest versions, etc.
    assert iri["ne"][10].item() == approx(5287032830.0, rel=1e-4)
    assert iri.NmF2.item() == approx(77149519900.0, rel=1e-4)
    assert iri.hmF2.item() == approx(312.819672, rel=1e-4)
    assert iri.foF2.item() == approx(2.49434066, rel=1e-4)
