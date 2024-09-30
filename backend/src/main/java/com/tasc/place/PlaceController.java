package com.tasc.place;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;

@RestController
@RequestMapping("/api")
public class PlaceController {

    @Autowired
    private PlaceService placeService;

    @GetMapping("/getAllPlace")
    public List<Place> getAllPlaces() {
        return placeService.getAllPlaces();
    }
}
