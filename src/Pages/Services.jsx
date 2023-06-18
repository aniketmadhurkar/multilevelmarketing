import React, { useEffect, useState } from "react"
import { SERVICES_URL } from "../apiUrls";

const Services = () => {
    const [services, setServices] = useState([])

    const fetchServicesData = () => {
        fetch(SERVICES_URL)
            .then(response => {
                return response.json()
            })
            .then(data => {
                setServices(data)
            })
    }
    useEffect(() => {
        fetchServicesData()
    }, [])

    return (
        <div>
            <section class="page-section bg-primary">
                <div class="container px-4 px-lg-5">
                    <div class="row gx-4 gx-lg-5 justify-content-center">
                        <div class="col-lg-8 text-center">
                            <h2 class="text-white mt-0">Services</h2>

                        </div>
                    </div>
                </div>
            </section>
            <section class="page-section" id="services">
                <div class="container">

                    <div>
                        {services.length > 0 && (
                            <div class="row">
                                {services.map(service => (

                                    <div class="col-lg-6 col-md-6 text-center" key={service.id}>
                                        <div class="mt-5">
                                            <div class="mb-2">
                                            <iframe
  width="560"
  height="315"
  auto
  src={"https://www.youtube.com/embed/"+service.video_id+"?controls=0&autoplay=false"}
  title="YouTube video player"
  frameborder="0"
  allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
  allowfullscreen
></iframe>

                                            </div>
                                            <h3 class="h4 mb-2">{service.title}</h3>
                                        </div>
                                    </div>

                                ))}
                            </div>
                        )}
                    </div>
                </div>
            </section>
        </div>
    );
};

export default Services