//
//  File.swift
//  ExtensionKitDemo
//
//  Created by Victor Marcias on 2019-06-04.
//  Copyright © 2019 Victor Marcias. All rights reserved.
//

import MapKit

extension MKMapView {
    
    ///
    /// Register a class for reusable annotation views
    ///
    @available(iOS 11.0, *)
    func registerAnnotationView(_ annotationClass: AnyClass) {
        register(annotationClass, forAnnotationViewWithReuseIdentifier: NSStringFromClass(annotationClass))
    }
    
    ///
    /// Returns a reusable instance of the MKAnnotationView class specified as parameter directly.
    /// - usage: let cell = mapView.dequeueReusableAnnotationView(AnnotationClass.self)
    ///
    @available(iOS 11.0, *)
    func dequeueReusableAnnotationView<T: MKAnnotationView>(_ type: T.Type, for annotation: MKAnnotation) -> T {
        let id = NSStringFromClass(T.self)
        guard let annotation = self.dequeueReusableAnnotationView(withIdentifier: id, for: annotation) as? T else {
            fatalError("Unable to dequeueReusableAnnotation of class \(id)")
        }
        return annotation
    }
    
    ///
    /// Returns a reusable instance of the MKAnnotationView class specified as parameter directly.
    /// - usage: let cell = mapView.dequeueReusableAnnotationView(AnnotationClass.self)
    ///
    func dequeueReusableAnnotationView<T: MKAnnotationView>(_ type: T.Type) -> T {
        let id = NSStringFromClass(T.self)
        guard let annotation = self.dequeueReusableAnnotationView(withIdentifier: id) as? T else {
            fatalError("Unable to dequeueReusableAnnotation of class \(id)")
        }
        return annotation
    }
}
